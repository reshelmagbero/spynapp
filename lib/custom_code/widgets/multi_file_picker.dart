// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:math';

import 'package:file_picker/file_picker.dart';

class MultiFilePicker extends StatefulWidget {
  const MultiFilePicker({
    super.key,
    this.width,
    this.height,
    this.onFilePicked,
    this.onFileRemoved,
    this.onFilesCleared,
    this.saveBtnColor,
    this.cancelBtnColor,
  });

  final double? width;
  final double? height;
  final Future Function(List<String>? base64UrlEncodeFiles)? onFilePicked;
  final Future Function(int? index)? onFileRemoved;
  final Future Function()? onFilesCleared;
  final Color? saveBtnColor;
  final Color? cancelBtnColor;

  @override
  State<MultiFilePicker> createState() => _MultiFilePickerState();
}

class _MultiFilePickerState extends State<MultiFilePicker> {
  final List<PlatformFile> files = [];
  var picking = false;
  var fileType = FileType.any;
  var multiSelect = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Select File Type',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    DropdownButtonFormField<FileType>(
                        value: fileType,
                        onChanged: (FileType? value) {
                          setState(() {
                            fileType = value!;
                          });
                        },
                        items: FileType.values
                            .skipWhile((v) => v == FileType.custom)
                            .map((v) => DropdownMenuItem(
                                  value: v,
                                  child: Text(v
                                      .toString()
                                      .split('.')
                                      .last
                                      .toUpperCase()),
                                ))
                            .toList(),
                        borderRadius: BorderRadius.circular(10),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Select Multiple',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Checkbox(
                    value: multiSelect,
                    onChanged: (v) {
                      setState(() {
                        multiSelect = v!;
                      });
                    },
                    activeColor: const Color(0xFF1a2f4b),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(child: _clearPickedFilesButton()),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: _getFilePickerButton(),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: ListView.separated(
              itemCount: files.length,
              itemBuilder: (context, index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: ListTile(
                      title: Text(files[index].name),
                      subtitle: Text(
                          'Size: ${getFileSizeString(bytes: files[index].size ?? 0)}'),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            files.removeAt(index);
                            widget.onFileRemoved?.call(index);
                          });
                        },
                      )),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 10,
              ),
            ),
          )
        ],
      ),
    );
  }

  _getFilePickerButton() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              widget.saveBtnColor ?? const Color(0xFF1a2f4b)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 20))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            picking ? 'Picking Files' : 'Choose Files',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          picking
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ))
              : const Icon(
                  Icons.file_copy_outlined,
                  color: Colors.white,
                  size: 18,
                ),
        ],
      ),
      onPressed: () {
        _pickFiles();
      },
    );
  }

  _clearPickedFilesButton() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(files.isEmpty
              ? Colors.grey
              : (widget.cancelBtnColor ?? const Color(0xffb1251b))),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 20))),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Clear Files',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.close,
            color: Colors.white,
            size: 18,
          ),
        ],
      ),
      onPressed: () {
        if (files.isNotEmpty) {
          setState(() {
            files.clear();
            widget.onFilesCleared?.call();
          });
        }
      },
    );
  }

  Future<void> _pickFiles() async {
    var result = await FilePicker.platform.pickFiles(
        onFileLoading: (v) {
          setState(() {
            picking = v != FilePickerStatus.done;
          });
        },
        type: fileType,
        allowMultiple: multiSelect);
    if (result != null) {
      setState(() {
        files.addAll(result.files);
        var encodedFiles =
            files.map((e) => base64UrlEncode(e.bytes ?? [])).toList();
        print('Encoded files -> $encodedFiles');
        widget.onFilePicked?.call(encodedFiles);
      });
    }
  }

  static String getFileSizeString({required int bytes, int decimals = 0}) {
    const suffixes = ["b", "kb", "mb", "gb", "tb"];
    if (bytes == 0) return '0${suffixes[0]}';
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }
}

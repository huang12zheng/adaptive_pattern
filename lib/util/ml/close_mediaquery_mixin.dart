// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';

import 'utils.dart';

// Adjust this number to work for the demo.
const double _proximityThreshold = 0.08;

// Set this to true to ignore any face size math and simply use the presence
// of a face as the deciding factor.
const bool _forceForAnySizeFace = false;

mixin CloseMediaQueryMixin on State {
  dynamic _scanResults;
  CameraController _camera;
  bool _isDetecting = false;
  bool _isDisplayingClose = false;
  bool _isLocked = false;
  double _faceAreaRatio = 0;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    CameraDescription description = await getCamera(CameraLensDirection.front);

    setState(() {
      _camera = CameraController(
        description,
        ResolutionPreset.low,
      );
    });

    await _camera.initialize();

    _camera.startImageStream((CameraImage image) {
      if (_isDetecting || _isLocked) return;

      _isDetecting = true;

      final FaceDetectorOptions options =
          FaceDetectorOptions(minFaceSize: 0.02);
      detect(image, FirebaseVision.instance.faceDetector(options).processImage)
          .then(
        (dynamic result) {
          setState(() {
            _scanResults = result;
          });

          _isDetecting = false;
        },
      ).catchError(
        (_) {
          _isDetecting = false;
        },
      );
    });
  }

  void _lockUpdates() {
    _isLocked = true;
    Timer(Duration(seconds: 2), () {
      _isLocked = false;
    });
  }

  bool _isCloseExperience() {
    if (_scanResults == null ||
        _camera == null ||
        !_camera.value.isInitialized) {
      return false;
    }

    if (_scanResults is List<Face>) {
      List<Face> faces = _scanResults;
      if (faces.isNotEmpty && _forceForAnySizeFace) {
        return true;
      }

      final Size imageSize = Size(
        _camera.value.previewSize.height,
        _camera.value.previewSize.width,
      );
      final double imageArea = imageSize.width * imageSize.height;

      for (Face face in faces) {
        final double faceArea =
            face.boundingBox.width * face.boundingBox.height;
        _faceAreaRatio = faceArea / imageArea;
        // Only display the close experience when the face is at least `_proximityThreshold` of the visible space.
        if (_faceAreaRatio >= _proximityThreshold) {
          return true;
        }
      }

      if (faces.isEmpty) {
        _faceAreaRatio = 0;
      }
    }

    return false;
  }

  bool isClose() {
    if (_isCloseExperience()) {
      if (!_isDisplayingClose) {
        _lockUpdates();
      }
      _isDisplayingClose = true;
      return true;
      
    } else {
      // Prevent screen from flickering between states.
      if (_isDisplayingClose) {
        _lockUpdates();
      }
      _isDisplayingClose = false;
      return false;
    }
  }

  MediaQuery transitionBuilder(BuildContext ctx,Widget child){
    final MediaQueryData data = MediaQuery.of(ctx);
    return MediaQuery(data: 
      data.copyWith(textScaleFactor: data.textScaleFactor* (isClose() ? 1 :2 )),
      child: child,
    );
  }
}


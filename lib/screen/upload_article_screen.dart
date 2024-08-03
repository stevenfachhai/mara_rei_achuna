import 'package:flutter/material.dart';

class UploadArticleScreen extends StatefulWidget {
  @override
  _UploadArticleScreenState createState() => _UploadArticleScreenState();
}

class _UploadArticleScreenState extends State<UploadArticleScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _author = '';
  String _publicationDate = '';
  String _content = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Article'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Author'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the author';
                  }
                  return null;
                },
                onSaved: (value) {
                  _author = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Publication Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the publication date';
                  }
                  return null;
                },
                onSaved: (value) {
                  _publicationDate = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Content'),
                maxLines: 6,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the content';
                  }
                  return null;
                },
                onSaved: (value) {
                  _content = value!;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Handle the upload or save action here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Article uploaded!')),
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text('Upload Article'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NewProductPage extends StatefulWidget {
  const NewProductPage({Key? key}) : super(key: key);
  static final routeName = "/new_product";
  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Product Name"

                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Product Name cannot be Empty!';
                  }
                  return null;
                },
                onSaved: (newValue) {

                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Product Description",

                ),
                maxLines: 3,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Product Name cannot be Empty!';
                  }
                  return null;
                },
                onSaved: (newValue) {

                },
              ),
              SizedBox(height: 10,),

              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Product Price",

                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Price cannot be Empty!';
                  }
                  if(double.parse(value)<=0.0){
                    return 'Provide valid Price!';
                  }
                  return null;
                },
                onSaved: (newValue) {

                },
              ),
              SizedBox(height: 10,),
              RaisedButton(
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: _saveProduct ,
                child: Text("Save" ),
              )
            ],

          ),
        ),
      ),
    ) ;
  }

  _saveProduct() {
  }
}

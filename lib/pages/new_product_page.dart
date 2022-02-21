import 'package:flutter/material.dart';
import 'package:product_app/models/product_model.dart';

class NewProductPage extends StatefulWidget {
  const NewProductPage({Key? key}) : super(key: key);
  static final routeName = "/new_product";
  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {

  final _formKey = GlobalKey<FormState>();

  var product = Product();

  _saveProduct(){

    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      print(product);
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 10,),
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

                  product.name = newValue!;
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
                    return 'Product Description cannot be Empty!';
                  }
                  return null;
                },
                onSaved: (newValue) {

                  product.description = newValue!;
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

                  product.price = double.parse(newValue!);

                  product.id = 1;
                },
              ),
              SizedBox(height: 20,),
              Text('Select Purchase Date'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('No Date Chosen'),
                    FlatButton(onPressed: (){
                      Future<DateTime?> fdt = showDatePicker(context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime.now()
                      );
                      fdt.then((value) => print(value!.toIso8601String()));
                    }, child: Text('Select Date'))

                  ],
                ),
              ),
              Center(
                child: RaisedButton(
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular(8)),
                  color: Theme.of(context).primaryColor,
                  onPressed: _saveProduct ,
                  child: Text("Save" ),
                ),
              )
            ],

          ),
        ),
      ),
    ) ;
  }

}

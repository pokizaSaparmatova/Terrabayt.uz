import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terrabayt_uz/data/models/category_data.dart';
import 'package:terrabayt_uz/resources/colors.dart';

class FilterDialog extends StatefulWidget {
  final int firstSelected;
  final Function(int index) onSaved;
  final CategoryData categogry;

  const FilterDialog(this.firstSelected, this.onSaved, this.categogry,
      {Key? key})
      : super(key: key);

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  int _selectedCategoryIndex = -1;

  @override
  void initState() {
    _selectedCategoryIndex = widget.firstSelected;
    super.initState();
  }

  void removeSelected() {
    _selectedCategoryIndex = -1;
    setState(() {});
  }

  void setSelected(int index) {
    _selectedCategoryIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          color: Colors.white),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Saralash",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () => removeSelected(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Icon(Icons.delete), Text("O'chirish")],
                      ),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  "Bo'yicha saralash",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ChipsChoice.single(
                value: _selectedCategoryIndex,
                onChanged: (val) => setSelected(val),
                choiceItems: C2Choice.listFrom<int, CategoryData>(
                    source: widget.categogry.child!,
                    value: (i, v) => i,
                    label: (i, v) => v.name),
                choiceStyle: C2ChipStyle.outlined(
                    color: Colors.grey,
                    foregroundStyle: const TextStyle(color: Colors.black),
                    borderWidth: 1,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    selectedStyle: C2ChipStyle.filled(
                        color: AppColors.primary,
                        foregroundStyle: const TextStyle(color: Colors.white))),
                wrapped: true,
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () => {saveSelected()},
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            AppColors.primary,
                            AppColors.redGradientEnd,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          tileMode: TileMode.clamp),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: const Text("Saqlash",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  saveSelected() {
    widget.onSaved.call(_selectedCategoryIndex);
    Navigator.pop(context);
  }
}

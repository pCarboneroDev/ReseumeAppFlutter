import 'package:flutter/material.dart';

class SkillsRow extends StatelessWidget {
  final List<String> selected;
  final List<String> languages;
  final List<String> frameworks;
  final List<String> other;

  final Function(Set<List<String>>) method;

  const SkillsRow({required this.selected, required this.languages, required this.frameworks, required this.other, required this.method}); 
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: ColorScheme.of(context).onSurface),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: SegmentedButton(
              segments: [
                ButtonSegment(
                  value: languages,
                  label: Text("Languages", overflow: TextOverflow.ellipsis, softWrap: false)
                ),
                ButtonSegment(
                  value: frameworks,
                  label: Text("Frameworks", overflow: TextOverflow.ellipsis, softWrap: false)
                ),
                ButtonSegment(
                  value: other,
                  label: Text("Other", overflow: TextOverflow.ellipsis, softWrap: false)
                )
              ], 
              selected: <List<String>>{selected},
              onSelectionChanged: (newS) {
                method(newS);
              },
            ),
          ),

          SizedBox(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: selected.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.5),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset: Offset(0, 1),
                      )
                    ],
                    color: ColorScheme.of(context).primaryContainer,
                    borderRadius: BorderRadius.circular(7),
                    border: BoxBorder.all(color: ColorScheme.of(context).onSurface, width: 2)
                  ),
                  child: Center(child: Text(selected[index], style: TextStyle(fontSize: 25))),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

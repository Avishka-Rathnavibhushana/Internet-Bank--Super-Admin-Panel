import 'package:flutter/material.dart';

Widget StaticSinglePageTable(
    List<String> tableHeader, List<List<String>> tableRow) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      DataTable(
        columns: <DataColumn>[
          for (String th in tableHeader)
            new DataColumn(
              label: Text(
                th,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

          // ),
        ],
        rows: <DataRow>[
          for (List<String> tr in tableRow)
            DataRow(
              cells: <DataCell>[
                for (int i = 0; i < tableHeader.length; i++)
                  DataCell(Text(tr[i])),
              ],
            ),
        ],
        dataRowColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected))
            return Color.fromARGB(255, 143, 114, 114);
          return Color.fromARGB(166, 233, 230, 230); // Use the default value.
        }),
      ),
      Flex(
        direction: Axis.horizontal,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            height: 40,
            color: Color.fromARGB(166, 233, 230, 230),
            child: Text("No Data"),
          )
        ],
      )
    ],
  );
}

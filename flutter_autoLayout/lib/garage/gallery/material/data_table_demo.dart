import 'package:flutter_autoLayout/public.dart';
import 'package:intl/intl.dart';

class DataTableDemo extends StatefulWidget {
  const DataTableDemo();

  @override
  _DataTableDemoSate createState() => _DataTableDemoSate();
}

class _DataTableDemoSate extends State<DataTableDemo> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;
  _DessertDataSource _dessertsDataSource;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dessertsDataSource ??= _DessertDataSource(context);
  }

  void _sort<T>(
    Comparable<T> Function(_Dessert d) getField,
    int columnIndex,
    bool ascending,
  ) {
    _dessertsDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AutolayoutLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(localizations.demoDataTableTitle),
      ),
      body: Scrollbar(
          child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          PaginatedDataTable(
            header: Text(localizations.dataTableHeader),
            rowsPerPage: _rowsPerPage,
            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsPerPage = value;
              });
            },
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _sortAscending,
            onSelectAll: _dessertsDataSource._selectAll,
            columns: [
              DataColumn(
                label: Text(localizations.dataTableColumnDessert),
                onSort: (columnIndex, ascending) =>
                    _sort((d) => d.name, columnIndex, ascending),
              ),
              DataColumn(
                label: Text(localizations.dataTableColumnDessert),
                numeric: true,
                onSort: (columnIndex, ascending) =>
                    _sort((d) => d.calories, columnIndex, ascending),
              ),
              DataColumn(
                label: Text(localizations.dataTableColumnDessert),
                numeric: true,
                onSort: (columnIndex, ascending) =>
                    _sort((d) => d.fat, columnIndex, ascending),
              ),
              DataColumn(
                label: Text(localizations.dataTableColumnDessert),
                numeric: true,
                onSort: (columnIndex, ascending) =>
                    _sort((d) => d.carbs, columnIndex, ascending),
              ),
              DataColumn(
                label: Text(localizations.dataTableColumnDessert),
                numeric: true,
                onSort: (columnIndex, ascending) =>
                    _sort((d) => d.protein, columnIndex, ascending),
              ),
              DataColumn(
                label: Text(localizations.dataTableColumnDessert),
                numeric: true,
                onSort: (columnIndex, ascending) =>
                    _sort((d) => d.sodium, columnIndex, ascending),
              ),
              DataColumn(
                label: Text(localizations.dataTableColumnDessert),
                numeric: true,
                onSort: (columnIndex, ascending) =>
                    _sort((d) => d.calcium, columnIndex, ascending),
              ),
              DataColumn(
                label: Text(localizations.dataTableColumnDessert),
                numeric: true,
                onSort: (columnIndex, ascending) =>
                    _sort((d) => d.iron, columnIndex, ascending),
              ),
            ],
            source: _dessertsDataSource,
          ),
        ],
      )),
    );
  }
}

class _Dessert {
  _Dessert(this.name, this.calories, this.fat, this.carbs, this.protein,
      this.sodium, this.calcium, this.iron);
  final String name;
  final int calories;
  final double fat;
  final int carbs;
  final double protein;
  final int sodium;
  final int calcium;
  final int iron;

  bool selected = false;
}

class _DessertDataSource extends DataTableSource {
  _DessertDataSource(this.context) {
    final localizations = AutolayoutLocalizations.of(context);
    _desserts = <_Dessert>[
      _Dessert(
        localizations.dataTableRowFrozenYogurt,
        159,
        6,
        24,
        4,
        87,
        14,
        1,
      ),
      _Dessert(
        localizations.dataTableRowIceCreamSandwich,
        237,
        9,
        37,
        4.3,
        129,
        8,
        1,
      ),
      _Dessert(
        localizations.dataTableRowEclair,
        262,
        16,
        24,
        6,
        337,
        6,
        7,
      ),
      _Dessert(
        localizations.dataTableRowCupcake,
        305,
        3.7,
        67,
        4.3,
        413,
        3,
        8,
      ),
      _Dessert(
        localizations.dataTableRowGingerbread,
        356,
        16,
        49,
        3.9,
        327,
        7,
        16,
      ),
      _Dessert(
        localizations.dataTableRowJellyBean,
        375,
        0,
        94,
        0,
        50,
        0,
        0,
      ),
      _Dessert(
        localizations.dataTableRowLollipop,
        392,
        0.2,
        98,
        0,
        38,
        0,
        2,
      ),
      _Dessert(
        localizations.dataTableRowHoneycomb,
        408,
        3.2,
        87,
        6.5,
        562,
        0,
        45,
      ),
      _Dessert(
        localizations.dataTableRowDonut,
        452,
        25,
        51,
        4.9,
        326,
        2,
        22,
      ),
      _Dessert(
        localizations.dataTableRowApplePie,
        518,
        26,
        65,
        7,
        54,
        12,
        6,
      ),
      _Dessert(
        localizations
            .dataTableRowWithSugar(localizations.dataTableRowFrozenYogurt),
        168,
        6,
        26,
        4,
        87,
        14,
        1,
      ),
      _Dessert(
        localizations.dataTableRowIceCreamSandwich,
        246,
        9,
        39,
        4.3,
        129,
        8,
        1,
      ),
      _Dessert(
        localizations.dataTableRowEclair,
        271,
        16,
        26,
        6,
        337,
        6,
        7,
      ),
      _Dessert(
        localizations.dataTableRowWithSugar(localizations.dataTableRowCupcake),
        314,
        3.7,
        69,
        4.3,
        413,
        3,
        8,
      ),
      _Dessert(
        localizations
            .dataTableRowWithSugar(localizations.dataTableRowGingerbread),
        345,
        16,
        51,
        3.9,
        327,
        7,
        16,
      ),
      _Dessert(
        localizations.dataTableRowJellyBean,
        364,
        0,
        96,
        0,
        50,
        0,
        0,
      ),
      _Dessert(
        localizations.dataTableRowWithSugar(localizations.dataTableRowLollipop),
        401,
        0.2,
        100,
        0,
        38,
        0,
        2,
      ),
      _Dessert(
        localizations
            .dataTableRowWithSugar(localizations.dataTableRowHoneycomb),
        417,
        3.2,
        89,
        6.5,
        562,
        0,
        45,
      ),
      _Dessert(
        localizations.dataTableRowWithSugar(localizations.dataTableRowDonut),
        461,
        25,
        53,
        4.9,
        326,
        2,
        22,
      ),
      _Dessert(
        localizations.dataTableRowWithSugar(localizations.dataTableRowApplePie),
        527,
        26,
        67,
        7,
        54,
        12,
        6,
      ),
      _Dessert(
        localizations
            .dataTableRowWithHoney(localizations.dataTableRowFrozenYogurt),
        223,
        6,
        36,
        4,
        87,
        14,
        1,
      ),
      _Dessert(
        localizations
            .dataTableRowWithHoney(localizations.dataTableRowIceCreamSandwich),
        301,
        9,
        49,
        4.3,
        129,
        8,
        1,
      ),
      _Dessert(
        localizations.dataTableRowWithHoney(localizations.dataTableRowEclair),
        326,
        16,
        36,
        6,
        337,
        6,
        7,
      ),
      _Dessert(
        localizations.dataTableRowWithHoney(localizations.dataTableRowCupcake),
        369,
        3.7,
        79,
        4.3,
        413,
        3,
        8,
      ),
      _Dessert(
        localizations
            .dataTableRowWithHoney(localizations.dataTableRowGingerbread),
        420,
        16,
        61,
        3.9,
        327,
        7,
        16,
      ),
      _Dessert(
        localizations
            .dataTableRowWithHoney(localizations.dataTableRowJellyBean),
        439,
        0,
        106,
        0,
        50,
        0,
        0,
      ),
      _Dessert(
        localizations.dataTableRowWithHoney(localizations.dataTableRowLollipop),
        456,
        0.2,
        110,
        0,
        38,
        0,
        2,
      ),
      _Dessert(
        localizations
            .dataTableRowWithHoney(localizations.dataTableRowHoneycomb),
        472,
        3.2,
        99,
        6.5,
        562,
        0,
        45,
      ),
      _Dessert(
        localizations.dataTableRowWithHoney(localizations.dataTableRowDonut),
        516,
        25,
        63,
        4.9,
        326,
        2,
        22,
      ),
      _Dessert(
          localizations
              .dataTableRowWithHoney(localizations.dataTableRowApplePie),
          582,
          26,
          77,
          7,
          54,
          12,
          6),
    ];
  }

  final BuildContext context;
  List<_Dessert> _desserts;

  void _sort<T>(Comparable<T> Function(_Dessert d) getField, bool ascending) {
    _desserts.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    final format = NumberFormat.decimalPercentPattern(
      locale: AutolayoutOptions.of(context).locale.toString(),
      decimalDigits: 0,
    );
    assert(index >= 0);
    if (index >= _desserts.length) return null;
    final dessert = _desserts[index];
    return DataRow.byIndex(
      index: index,
      selected: dessert.selected,
      onSelectChanged: (value) {
        if (dessert.selected != value) {
          _selectedCount += value ? 1 : -1;
          assert(_selectedCount >= 0);
          dessert.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Text(dessert.name)),
        DataCell(Text('${dessert.calories}')),
        DataCell(Text(dessert.fat.toStringAsFixed(1))),
        DataCell(Text('${dessert.carbs}')),
        DataCell(Text(dessert.protein.toStringAsFixed(1))),
        DataCell(Text('${dessert.sodium}')),
        DataCell(Text('${format.format(dessert.calcium / 100)}')),
        DataCell(Text('${format.format(dessert.iron / 100)}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _desserts.length;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
    for (final dessert in _desserts) {
      dessert.selected = checked;
    }
    _selectedCount = checked ? _desserts.length : 0;
    notifyListeners();
  }
}

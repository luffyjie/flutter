/// print
String prettyPrintList(Iterable iter) {
  if (iter == null) return 'NULL';

  final buff = StringBuffer();
  var isFirst = true;

  buff.write('[');

  for (final val in iter) {
    if (!isFirst) buff.write(', ');
    isFirst = false;
    if (val is String) {
      buff.write('"$val"');
    } else {
      buff.write(val.toString());
    }
  }

  buff.write(']');

  return buff.toString();
}

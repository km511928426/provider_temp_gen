enum Temp {
  stateless,
  stateful,
}

Temp? convertTemp(String temp) {
  switch (temp) {
    case 'stateless':
      return Temp.stateless;
    case 'stateful':
      return Temp.stateful;
  }
  return Temp.stateless;
}

enum Temp {
  provider,
  stateless,
  stateful,
}

Temp? convertTemp(String temp) {
  switch (temp) {
    case 'provider':
      return Temp.provider;
    case 'stateless':
      return Temp.stateless;
    case 'stateful':
      return Temp.stateful;
  }
  return Temp.provider;
}

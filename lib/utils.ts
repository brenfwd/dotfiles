export function* zip<T1, T2>(iter1: Iterable<T1>, iter2: Iterable<T2>): Iterable<[T1, T2]> {
  const it1 = iter1[Symbol.iterator]();
  const it2 = iter2[Symbol.iterator]();
  while (true) {
    const val1 = it1.next();
    const val2 = it2.next();
    if (val1.done || val2.done) {
      break;
    }
    yield [val1.value, val2.value];
  }
}

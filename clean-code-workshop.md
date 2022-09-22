---
title: Clean Code
author: Oshgnacknak
date: \today
theme: simple
lang: de_DE
pandoc-latex-fontsize:
  - classes: [small]
    size: tiny
---

# Robert "Uncle Bob" C. Martin

::: columns

:::: column
![Robert C. Martin (Quelle: Wikipedia)](./uncle-bob.jpg){ width=100% }
::::

:::: column
- Geboren am 5. Dezember 1952

- Autor einiger Bücher zu den Themen Programmieren, Architektur und Design.

- Darunter das Buch "Clean Code: A Handbook of Agile Software Craftsmanship"
::::

:::

# Clean Code: A Handbook of Agile Software Craftsmanship

::: columns

:::: column
![Clean Code (Quelle: `stancalau.ro`)](./clean-code.jpg){ width=100% }
::::

:::: column
- Die Bibel dieses Workshops
::::

:::

# Was ist guter Code überhaupt?

![wtf indeed](wtfm.jpg){ width=65% }

# Und was ist schlechter Code?

```{.java .small}
ListItem<ListItem<T>> makeListOfLists(ListItem<T> flatList,
                PredicateWithException<T> predicate,
                boolean asClone) throws Exception {
  ListItem<ListItem<T>> listOfLists = new ListItem<>(), listOfListsTail = listOfLists;
  ListItem<T> listTail = null;
  int i = 0, j = 0;
  ListItem<T> pred = null, curr = flatList;
  while (curr != null) {
    if (predicate.test(curr.key, i, j)) { // current character is a sentinel
      // outer list is not empty
      listOfListsTail = listOfListsTail.next = new ListItem<>();
      if (!asClone && pred != null)
        pred.next = null;
      i++;
      j = 0;
      listTail = null;
    } else { // current character is not a sentinel
      ListItem<T> tailNew =
          asClone ? new ListItem<T>(curr.key) : curr;
      if (listTail == null)
        // inner list is empty
        listOfListsTail.key = listTail = tailNew;
      else
        listTail = listTail.next = tailNew;
      j++;
    }
    // update pointers
    pred = curr;
    curr = curr.next;
  }
  return listOfLists;
}
```

# Das muss doch besser gehen!

```{.java .small}
ListItem<ListItem<T>> makeListOfListsInPlace(
    ListItem<T> list,
    PredicateWithException<T> pred) throws Exception {
  var llist = new ListItemList<>(list);
  var res = new ListItemList<ListItem<T>>();

  int column = splitFirstRow(pred, llist, res);
  int row = 0;

  while (!llist.isEmpty()) {
    row = removeSeparator(pred, llist, column, row);
    column = splitRow(pred, llist, res, row);
  }

  return res.head;
}
```

# Da geht aber noch mehr...

```{.java .small}
ListItem<ListItem<T>> makeListOfListsInPlace(
    ListItem<T> list,
    PredicateWithException<T> pred) throws Exception {
  return new ListIntoLinesSplitter<>(list).splitOn(pred);
}
```

# Namen

![Quelle: `/r/ProgrammerHumor`](./oop-names.png){ width=65% }

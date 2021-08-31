package ru.job4j.collection;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import ru.job4j.collection.list.List;
import ru.job4j.collection.list.SimpleArrayList;

import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.stream.IntStream;

public class SimpleArrayListTest {
    List<Integer> list1;
    List<Integer> list2 = new SimpleArrayList<>();

    @Before
    public void initData() {
        list1 = new SimpleArrayList<>(5);
        list1.add(1);
        list1.add(2);
        list1.add(3);
    }

    @Test
    public void whenAddThenSizeIncrease() {
        Assert.assertEquals(3, list1.size());
    }

    @Test
    public void whenAddAndGetByCorrectIndex() {
        Assert.assertEquals(Integer.valueOf(1), list1.get(0));
    }

    @Test(expected = IndexOutOfBoundsException.class)
    public void whenAddAndGetByIncorrectIndexThenGetException() {
        list1.get(5);
    }

    @Test
    public void whenRemoveThenGetValueAndSizeDecrease() {
        Assert.assertEquals(3, list1.size());
        Assert.assertEquals(Integer.valueOf(2), list1.remove(1));
        Assert.assertEquals(2, list1.size());
    }

    @Test(expected = IndexOutOfBoundsException.class)
    public void whenRemoveByIncorrectIndexThenGetException() {
        list1.remove(5);
    }

    @Test
    public void whenRemoveThenMustNotBeEmpty() {
        list1.remove(1);
        Assert.assertEquals(Integer.valueOf(1), list1.get(0));
        Assert.assertEquals(Integer.valueOf(3), list1.get(1));
    }

    @Test
    public void whenAddNullThenMustBeSameBehavior() {
        list1 = new SimpleArrayList<>(3);
        list1.add(null);
        list1.add(null);
        Assert.assertEquals(2, list1.size());
        Assert.assertNull(list1.get(0));
        Assert.assertNull(list1.get(1));
    }

    @Test
    public void whenSetThenGetOldValueAndSizeNotChanged() {
        Assert.assertEquals(Integer.valueOf(2), list1.set(1, 22));
        Assert.assertEquals(3, list1.size());
    }

    @Test(expected = IndexOutOfBoundsException.class)
    public void whenSetByIncorrectIndexThenGetException() {
        list1.set(5, 22);
    }

    @Test
    public void whenGetIteratorFromEmptyListThenHasNextReturnFalse() {
        list1 = new SimpleArrayList<>(5);
        Assert.assertFalse(list1.iterator().hasNext());
    }

    @Test(expected = NoSuchElementException.class)
    public void whenGetIteratorFromEmptyListThenNextThrowException() {
        list1 = new SimpleArrayList<>(5);
        list1.iterator().next();
    }

    @Test
    public void whenGetIteratorTwiceThenStartAlwaysFromBeginning() {
        Assert.assertEquals(Integer.valueOf(1), list1.iterator().next());
        Assert.assertEquals(Integer.valueOf(1), list1.iterator().next());
    }

    @Test
    public void whenCheckIterator() {
        Iterator<Integer> iterator = list1.iterator();
        Assert.assertTrue(iterator.hasNext());
        Assert.assertEquals(Integer.valueOf(1), iterator.next());
        Assert.assertTrue(iterator.hasNext());
        Assert.assertEquals(Integer.valueOf(2), iterator.next());
        Assert.assertTrue(iterator.hasNext());
        Assert.assertEquals(Integer.valueOf(3), iterator.next());
        Assert.assertFalse(iterator.hasNext());
    }

    @Test
    public void whenNoPlaceThenMustIncreaseCapacity() {
        IntStream.range(3, 10).forEach(v -> list1.add(v));
    }

    @Test(expected = ConcurrentModificationException.class)
    public void whenAddAfterGetIteratorThenMustBeException() {
        Iterator<Integer> iterator = list1.iterator();
        list1.add(4);
        iterator.next();
    }

    @Test(expected = ConcurrentModificationException.class)
    public void whenRemoveAfterGetIteratorThenMustBeException() {
        Iterator<Integer> iterator = list1.iterator();
        list1.add(0);
        iterator.next();
    }

    @Test
    public void whenCapacityList() {
        Assert.assertEquals(10, list2.length());
    }

    @Test
    public void whenExtensionCapacityList() {
        for (int i = 0; i <= 10; i++) {
            list2.add(i);
        }
        Assert.assertEquals(20, list2.length());
    }
}
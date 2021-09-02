package ru.job4j.io;

import java.io.FileOutputStream;
import java.util.Arrays;

public class MatrixResult {
    public static void main(String[] args) {
        try (FileOutputStream out = new FileOutputStream("matrixResult.txt")) {
            out.write(Arrays.deepToString(Matrix.multiple(30)).getBytes());
            out.write(System.lineSeparator().getBytes());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
package ru.job4j.io;

import java.io.FileInputStream;

public class EvenNumberFile {
    public static void main(String[] args) {
        try (FileInputStream in = new FileInputStream("even.txt")) {
            StringBuilder number = new StringBuilder();
            int read;
            while ((read = in.read()) != -1) {
                number.append((char) read);
                }
            String[] num = number.toString().split(System.lineSeparator());
            for (String n : num) {
                boolean rsl = Integer.parseInt(n) % 2 == 0;
                System.out.println(n + " - " + rsl);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

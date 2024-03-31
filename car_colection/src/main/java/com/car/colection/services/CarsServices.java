package com.car.colection.services;

import com.car.colection.models.Cars;
import lombok.Getter;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
@Getter // Додаємо аннотацію @Getter для автоматичного генерування методу доступу до поля availableColors
public class CarsServices {
    private final List<Cars> cars = new ArrayList<>();
    private long idCounter = 1;

    // Оголошуємо список доступних кольорів
    private final List<String> availableColors = Arrays.asList("Червоний", "Синій", "Оранжевий", "Жовтий", "Зелений", "Білий", "Чорний" ,"Коричневий", "Бежевий", "Фіолетовий", "Сірий");

    public List<Cars> getAllCars() {
        return cars;
    }

    public void addCar(Cars car) {
        car.setId(idCounter++);
        cars.add(car);
    }

    public void deleteCar(Long id) {
        cars.removeIf(car -> car.getId().equals(id));
    }

    public Cars getCarById(Long id) {
        for (Cars car : cars) {
            if (car.getId().equals(id)) {
                return car;
            }
        }
        return null; // Якщо автомобіль з вказаним id не знайдено
    }
}

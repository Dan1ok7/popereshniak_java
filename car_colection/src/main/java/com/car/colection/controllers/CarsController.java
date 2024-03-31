package com.car.colection.controllers;

import com.car.colection.models.Cars;
import com.car.colection.services.CarsServices;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class CarsController {
    private final CarsServices carService;

    @GetMapping("/cars")
    public String cars(Model model) {
        model.addAttribute("carsList", carService.getAllCars());
        model.addAttribute("availableColors", carService.getAvailableColors()); // Додано атрибут для передачі списку доступних кольорів у представлення
        return "cars";
    }

    @PostMapping("/cars")
    public String addCar(@RequestParam String brand, @RequestParam String model, @RequestParam String registrationNumber, @RequestParam String color) {
        Cars car = new Cars(null, brand, model, registrationNumber, color); // Додано параметр коліру
        carService.addCar(car);
        return "redirect:/cars";
    }


    @PostMapping("/cars/delete/{id}")
    public String deleteCar(@PathVariable Long id) {
        carService.deleteCar(id);
        return "redirect:/cars";
    }

    @GetMapping("/cars/{id}")
    public String carDetails(@PathVariable Long id, Model model) {
        Cars car = carService.getCarById(id);
        if (car != null) {
            model.addAttribute("car", car);
            return "cars-info";
        } else {
            return "redirect:/cars";
        }
    }
}

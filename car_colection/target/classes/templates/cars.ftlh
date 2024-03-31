<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Список автомобілів</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .car-item {
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .car-info {
            flex-grow: 1;
            margin-right: 10px;
        }

        .btn {
            padding: 8px 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            width: auto;
            text-align: center;
            display: inline-block;
            transition: background-color 0.3s ease;
            margin-right: 4px; /* Доданий відступ між кнопками */
        }

        .btn-info {
            margin-right: 10px;
        }

        .btn-delete {
            background-color: #dc3545;
        }

        .btn-delete:hover {
            background-color: #c82333;
        }

        .form-container {
            margin-top: 20px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 20px; /* Доданий відступ знизу */
        }

        .form-container label {
            display: block;
            margin-bottom: 10px;
        }

        .form-container input[type="text"],
        .form-container select {
            width: calc(100% - 2px); /* Для вирахування відступів на 1px з обох сторін */
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
            font-size: 16px;
            cursor: pointer;
            appearance: none; /* Видаляємо настання стилізації для браузера */
            margin-bottom: 10px; /* Доданий відступ між полями */
        }

        .form-container input[type="text"]:hover,
        .form-container select:hover,
        .form-container input[type="text"]:focus,
        .form-container select:focus {
            border-color: #007bff;
        }

        .form-container button[type="submit"] {
            padding: 8px 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            margin-top: 4px; /* Доданий відступ зверху */
        }

        .form-container button[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Список автомобілів</h1>
        <ul>
            <#list carsList as car>
                <li class="car-item">
                    <div class="car-info">
                        <strong>Марка:</strong> ${car.brand}<br>
                        <strong>Модель:</strong> ${car.model}<br>
                        <strong>Реєстраційний номер:</strong> ${car.registrationNumber}<br>
                        <strong>Колір:</strong> ${car.color} <!-- Додали вивід коліру -->
                    </div>
                    <div>
                        <a class="btn btn-info" href="/cars/${car.id}">Інфо</a>
                        <form action="/cars/delete/${car.id}" method="post" onsubmit="return confirm('Ви впевнені, що хочете видалити цей автомобіль?')">
                            <button type="submit" class="btn btn-delete">Видалити</button>
                        </form>
                    </div>
                </li>
            </#list>
        </ul>
        <div class="form-container">
            <h2>Додати новий автомобіль</h2>
            <form action="/cars" method="post">
                <label for="brand">Марка:</label>
                <input type="text" id="brand" name="brand" required placeholder="Наприклад: Toyota"><br>
                <label for="model">Модель:</label>
                <input type="text" id="model" name="model" required placeholder="Наприклад: Camry"><br>
                <label for="registrationNumber">Реєстраційний номер:</label>
                <input type="text" id="registrationNumber" name="registrationNumber" required placeholder="Наприклад: AA1234AA"><br>
                <label for="color">Колір:</label>
                <select id="color" name="color" required>
                    <#list availableColors as color>
                        <option value="${color}">${color}</option>
                    </#list>
                </select><br>
                <button type="submit" class="btn">Додати</button>
            </form>
        </div>
    </div>
</body>
</html>

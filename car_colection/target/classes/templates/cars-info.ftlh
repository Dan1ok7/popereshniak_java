<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Деталі автомобіля</title>
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

        .btn-info,
        .btn-delete {
            padding: 8px 16px;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            width: auto;
            text-align: center;
            display: inline-block;
        }

        .btn-info {
            background-color: #007bff; /* Синій колір */
        }

        .btn-delete {
            background-color: #dc3545; /* Червоний колір */
        }

        .btn-info:hover,
        .btn-delete:hover {
            filter: brightness(0.8); /* Зменшує яскравість при наведенні */
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #007bff;
            text-decoration: none;
        }

        .form-container {
            margin-top: 20px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-container label {
            display: block;
            margin-bottom: 10px;
        }

        .form-container input[type="text"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-container button[type="submit"] {
            padding: 8px 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }

        .form-container button[type="submit"]:hover {
            background-color: #0056b3;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Деталі автомобіля</h1>
        <div>
            <strong>Марка:</strong> ${car.brand}<br>
            <strong>Модель:</strong> ${car.model}<br>
            <strong>Реєстраційний номер:</strong> ${car.registrationNumber}<br>
            <strong>Колір:</strong> ${car.color}<br> <!-- Додали вивід коліру -->
        </div>
        <div class="button-group">
            <form action="/cars">
                <button type="submit" class="btn-info">Повернутись до списку автомобілів</button>
            </form>
            <form action="/cars/delete/${car.id}" method="post" onsubmit="return confirm('Ви впевнені, що хочете видалити цей автомобіль?')">
                <button type="submit" class="btn-delete">Видалити</button>
            </form>
        </div>
    </div>
</body>
</html>

# testUala

Este proyecto es una aplicación móvil diseñada para listar y buscar ciudades a partir de una API. La aplicación permite filtrar las ciudades por prefijo, mostrar los resultados en una lista y, al seleccionar una ciudad, mostrar su ubicación en un mapa.

## Enfoque de la Solución

En primer lugar, me enfoqué en la consulta a la API para la obtención de los datos. La carga de datos se realizó de manera asíncrona.

Una vez que los datos fueron obtenidos y registrados, procedí a listar la información de las ciudades de manera que se mostrara toda la información relevante traída desde la API. Para darle forma a estos datos y asegurar una estructura coherente, creé los modelos necesarios. Estos modelos representan la estructura de los datos de las ciudades, facilitando su manipulación y presentación en la aplicación.

En el ViewModel, gestioné tanto la obtención de datos como la lógica de búsqueda de las ciudades. Este componente actúa como un intermediario entre los modelos y las vistas, controlando cómo se obtienen, filtran y procesan los datos antes de ser presentados.

Finalmente, las vistas se actualizaron automáticamente con la información proporcionada por el ViewModel. Esto significa que las vistas muestran dinámicamente las ciudades y sus ubicaciones en el mapa.

## Estructura del Proyecto

El proyecto está organizado de la siguiente manera, utilice la arquitectura MVVM:

- **Models**: Contiene la definición del modelo `City` y `Coord`.
- **ViewModels**: Contiene la lógica de la aplicación para gestionar los datos y la búsqueda de ciudades (`CityViewModel` y `CityMapViewModel`).
- **Views**: Contiene las vistas principales de la aplicación (`ContentView`, `CityMapView`, `CityDetailView`).
- **Tests**: Contiene las pruebas unitarias y de UI para el proyecto.


# testUala
This project is a mobile application designed to list and search for cities from an API. The application allows filtering cities by prefix, displaying the results in a list, and, upon selecting a city, showing its location on a map.

## Solution Approach
First, I focused on querying the API to obtain the data. Data loading was performed asynchronously.

Once the data was obtained and recorded, I proceeded to list the information of the cities in a way that all relevant information brought from the API was displayed. To shape these data and ensure a coherent structure, I created the necessary models. These models represent the structure of the city data, facilitating their manipulation and presentation in the application.

In the ViewModel, I managed both data retrieval and the logic for searching the cities. This component acts as an intermediary between the models and the views, controlling how data is retrieved, filtered, and processed before being presented.

Finally, the views were automatically updated with the information provided by the ViewModel. This means that the views dynamically display the cities and their locations on the map.

## Project Structure
The project is organized as follows, using the MVVM architecture:

- **Models**: Contains the definition of the City and Coord models.
- **ViewModels**: Contains the application logic to manage the data and city searches (CityViewModel and CityMapViewModel).
- **Views**: Contains the main views of the application (ContentView, CityMapView, CityDetailView).
- **Tests**: Contains unit and UI tests for the project.

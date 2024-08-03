# testUala

Este proyecto es una aplicación móvil diseñada para listar y buscar ciudades a partir de una API. La aplicación permite filtrar las ciudades por prefijo, mostrar los resultados en una lista y, al seleccionar una ciudad, mostrar su ubicación en un mapa.

## Enfoque de la Solución

En primer lugar, me enfoqué en la consulta a la API para la obtención de los datos. La carga de datos se realizó de manera asíncrona para asegurar que la aplicación permaneciera responsiva durante este proceso.

Una vez que los datos fueron obtenidos y registrados, procedí a listar la información de las ciudades de manera que se mostrara toda la información relevante traída desde la API. Para darle forma a estos datos y asegurar una estructura coherente, creé los modelos necesarios. Estos modelos representan la estructura de los datos de las ciudades, facilitando su manipulación y presentación en la aplicación.

En el ViewModel, gestioné tanto la obtención de datos como la lógica de búsqueda de las ciudades. Este componente actúa como un intermediario entre los modelos y las vistas, controlando cómo se obtienen, filtran y procesan los datos antes de ser presentados.

Finalmente, las vistas se actualizaron automáticamente con la información proporcionada por el ViewModel. Esto significa que las vistas muestran dinámicamente las ciudades y sus ubicaciones en el mapa.

## Estructura del Proyecto

El proyecto está organizado de la siguiente manera, utilice la arquitectura MVVM:

- **Models**: Contiene la definición del modelo `City` y `Coord`.
- **ViewModels**: Contiene la lógica de la aplicación para gestionar los datos y la búsqueda de ciudades (`CityViewModel` y `CityMapViewModel`).
- **Views**: Contiene las vistas principales de la aplicación (`ContentView`, `CityMapView`, `CityDetailView`).
- **Tests**: Contiene las pruebas unitarias y de UI para el proyecto.

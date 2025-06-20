# Guía de Revisión de Código para Proyectos Java con Spring Boot

## 📁 Estructura del Proyecto
Verifica que la estructura del proyecto siga las convenciones estándar de Spring Boot. A continuación, se muestran ejemplos típicos para **Spring Web** y **Spring WebFlux**.

### Estructura para Spring Web
```
src/
├── main/
│   ├── java/
│   │   └── com.pichincha.<celula>.<nombre-proyecto>/
│   │       ├── configuration/         # Configuraciones generales
│   │       ├── controller/            # Controladores REST
│   │       ├── service/               # Interfaces de servicios
│   │       │   └── impl/              # Implementaciones de servicios
│   │       ├── repository/            # Interfaces de acceso a datos
│   │       │   └── impl/              # Implementaciones de repositorios
│   │       ├── exception/             # Manejo de excepciones
│   │       ├── domain/                # Entidades del dominio
│   │       │   ├── dto/               # Objetos de transferencia de datos
│   │       │   └── enums/             # Enumeraciones
│   │       ├── helper/                # Clases instanciables de ayuda
│   └── resources/
│       ├── application.yml           # Configuración principal
│       └── db.migration/             # Scripts de migración de base de datos
├── test/
│   └── java/
│       └── com.pichincha.test.<celula>.<nombre-proyecto>/
│           ├── configuration/
│           ├── controller/
│           ├── service/
│           ├── repository/
│           ├── util/
│           └── helper/
├── azure-pipelines.yml               # Configuración de CI/CD
├── Dockerfile                        # Imagen de contenedor
├── README.md                         # Documentación del proyecto
├── settings.xml                      # Configuración de Maven
└── <nombre-proyecto>.yml             # Documentación de API (Swagger/OpenAPI)
```

#### Ejemplo de código para Spring Web (Controller)
```java
// UserController.java
@RestController
@RequestMapping("/users")
public class UserController {
    @GetMapping("/{id}")
    public ResponseEntity<UserDto> getUser(@PathVariable Long id) {
        // lógica para retornar usuario
        return ResponseEntity.ok(new UserDto());
    }
}
```

### Estructura para Spring WebFlux
```
src/
├── main/
│   ├── java/
│   │   └── com.pichincha.<celula>.<nombre-proyecto>/
│   │       ├── configuration/         # Configuraciones generales
│   │       ├── repository/            # Interfaces de acceso a datos
│   │       │   └── impl/              # Implementaciones de repositorios
│   │       ├── handler/               # Manejadores reactivos
│   │       │   └── impl/              # Implementaciones de manejadores
│   │       ├── service/               # Interfaces de servicios
│   │       │   └── impl/              # Implementaciones de servicios
│   │       ├── exception/             # Manejo de excepciones
│   │       ├── domain/                # Entidades del dominio
│   │       │   ├── dto/               # Objetos de transferencia de datos
│   │       │   └── enums/             # Enumeraciones
│   │       ├── util/                  # Clases utilitarias
│   │       ├── helper/                # Clases instanciables de ayuda
│   └── resources/
│       ├── application.yml           # Configuración principal
│       └── db.migration/             # Scripts de migración de base de datos
├── test/
│   └── java/
│       └── com.pichincha.test.<celula>.<nombre-proyecto>/
│           ├── configuration/
│           ├── repository/
│           ├── service/
│           ├── util/
│           ├── handler/
│           └── helper/
├── azure-pipelines.yml               # Configuración de CI/CD
├── Dockerfile                        # Imagen de contenedor
├── README.md                         # Documentación del proyecto
├── settings.xml                      # Configuración de Maven
└── <nombre-proyecto>.yml             # Documentación de API (Swagger/OpenAPI)
```

#### Ejemplo de código para Spring WebFlux (Handler)
```java
// UserHandler.java
@Component
public class UserHandler {
    public Mono<ServerResponse> getUser(ServerRequest request) {
        // lógica reactiva
        return ServerResponse.ok().bodyValue("Usuario encontrado");
    }
}
```

---

## 🧠 Convenciones de Nomenclatura

### Clases
- **Formato**: `UpperCamelCase`
- **Ejemplo**: `UserService`, `OrderController`, `OrderHandler`

### Métodos y Variables
- **Formato**: `lowerCamelCase`
- **Ejemplo**: `getUserById()`, `userList`

### Constantes
- **Formato**: `UPPER_SNAKE_CASE`
- **Ejemplo**: `MAX_RETRY_COUNT`

### Paquetes
- **Formato**: minúsculas, sin guiones ni mayúsculas
- **Ejemplo**: `com.empresa.proyecto.service`

---

## 🧹 Estilo de Código

- Se recomienda utilizar el estilo de **Google Java Style**. Puedes acceder al repositorio oficial en el siguiente enlace: [Google Style Guide](https://github.com/google/styleguide).
- Configura el estilo de Java en el editor o IDE que utilices para garantizar consistencia en el formato del código.

---

## 📛 Convenciones de Nombres para Proyectos

- El nombre del proyecto debe seguir el siguiente formato: `<name_1>-<name_2>-<name_3>`.
  - **`name_1`**: Iniciales de tu célula (por ejemplo, `crd` para Crédito).
  - **`name_2`**: Arquitectura utilizada (por ejemplo, `msa` para Microservice Architecture).
  - **`name_3`**: Nombre del proyecto.
- **Ejemplo**: `crd-msa-customer`.

---

## 📦 Estructura de Paquetes

- Para el manejo de la estructura de los paquetes, se recomienda seguir el enfoque de **Domain-Driven Design (DDD)**.
- Organiza los paquetes de manera que reflejen los contextos del dominio y las responsabilidades de cada módulo.
- **Ejemplo**:
  - `com.pichincha.<celula>.<nombre-proyecto>.domain` para entidades del dominio.
  - `com.pichincha.<celula>.<nombre-proyecto>.service` para lógica de negocio.

---

## 🔐 Seguridad
Verifica los siguientes puntos de seguridad:
- **Validación de Inputs**: Valida y sanitiza todos los inputs usando anotaciones como `@Valid`, `@NotNull`, `@Size`, etc.
- **Autenticación y Autorización**: Implementa mecanismos adecuados con `Spring Security`.
- **Logs Seguros**: Evita exponer información sensible en logs o respuestas.
- **Configuración de Seguridad**: Usa filtros y configuraciones de seguridad.

---

## 🧪 Calidad de Código

### Principios Generales
- **Evitar valores quemados**: Usa constantes o archivos de configuración.
- **Separación de responsabilidades**: Aplica principios SOLID.
- **Inyección de dependencias**: Usa `@Autowired` o constructor injection.
- **Evitar lógica en controladores o manejadores**: Delegar a servicios.
- **Evitar duplicación de código**: Reutiliza componentes y servicios.

## 🧪 Pruebas

- Agrega la palabra `Test` al final de la clase que se desea probar. Ejemplo: `PersonServiceTest`.
- Los nombres de las pruebas deben explicar claramente el propósito y el resultado esperado. Ejemplo:
  ```java
  public void sendIncorrectClientIdAndThrowsErrorTest() {
      // lógica de prueba
  }
  ```
- **Cobertura mínima**: Asegúrate de que la cobertura de pruebas sea al menos del 75% (puede variar según la célula).
- **Nombres descriptivos**: Usa nombres claros para los métodos de prueba, como `shouldReturnUserWhenIdIsValid`.
- **Frameworks recomendados**: Usa JUnit y Mockito para pruebas unitarias e integración.

#### Ejemplo de prueba unitaria (JUnit + Mockito)
```java
// UserServiceTest.java
@ExtendWith(MockitoExtension.class)
class UserServiceTest {
    @Mock UserRepository userRepository;
    @InjectMocks UserServiceImpl userService;

    @Test
    void shouldReturnUserWhenIdIsValid() {
        when(userRepository.findById(1L)).thenReturn(Optional.of(new User(1L, "Juan")));
        User user = userService.getUserById(1L);
        assertEquals("Juan", user.getName());
    }
}
```

#### Ejemplo de prueba de integración (Spring Boot)
```java
// UserControllerIT.java
@SpringBootTest
@AutoConfigureMockMvc
class UserControllerIT {
    @Autowired MockMvc mockMvc;

    @Test
    void shouldReturnOkWhenUserExists() throws Exception {
        mockMvc.perform(get("/users/1"))
               .andExpect(status().isOk());
    }
}
```

---

## 🧰 Buenas Prácticas

### Anotaciones
- Usa `@Service`, `@Repository`, `@Controller` o `@RestController` para Spring Web.
- Usa `@Component` y `@RouterFunction` para Spring WebFlux.
- Maneja errores globalmente con `@ControllerAdvice`.

### Documentación
- Documenta APIs con Swagger/OpenAPI.
  - Usa comentarios solo cuando sea estrictamente necesario.

### Logs
- Usa SLF4J (`LoggerFactory.getLogger(...)`) para logs.
- Evita `System.out.println`.

---

## ⚙️ Configuración y Performance

### Configuración
- Usa `application.yml` para configuración externa.
- Configura adecuadamente el `connection pool`.

### Performance
- Usa `@Transactional` para manejo de transacciones en Spring Web.
- Usa `WebClient` para llamadas HTTP no bloqueantes en Spring WebFlux.
- Valida el uso de `@Async` y `@Scheduled` si aplica.

---

## 🧹 Linting y Estilo

- Sigue una guía de estilo como Google Java Style.
- Usa herramientas como Checkstyle, PMD o SonarQube.
- Nombrar archivos y clases de prueba con sufijo `Test`.

---

## ✅ Checklist de Revisión

- [ ] ¿Se siguen las convenciones de nomenclatura?
- [ ] ¿La estructura del proyecto es clara y modular?
- [ ] ¿Se evita el uso de valores quemados?
- [ ] ¿Se aplican principios SOLID?
- [ ] ¿Se usan pruebas automatizadas?
- [ ] ¿Se maneja adecuadamente la seguridad?
- [ ] ¿Se documenta la API?
- [ ] ¿Se usan logs correctamente?
- [ ] ¿Se evita código duplicado?
- [ ] ¿Se maneja correctamente la configuración?

---

## ✅ Recomendaciones

- Utiliza **Maven Wrapper** para garantizar la consistencia de versiones.
- Aplica patrones de diseño cuando sea necesario. Más información: [Patrones de Diseño](https://refactoring.guru/design-patterns).
- Usa el plugin **SonarLint** para verificar el estilo del código y evitar problemas antes de enviar a pipeline.
- Exponer estados finales de los APIs utilizando `spring-boot-starter-actuator`.
- **Siempre aplica principios SOLID.**
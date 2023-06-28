package dev.enrico.simpleAPIUsers;

import io.swagger.v3.oas.models.OpenAPI;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class SimpleApiUsersApplication {

	public static void main(String[] args) {
		SpringApplication.run(SimpleApiUsersApplication.class, args);
	}

	@Bean
	public OpenAPI customOpenAPI() {
		return new OpenAPI()
				.info(new io.swagger.v3.oas.models.info.Info()
						.title("API Users")
						.version("1.0.0")
						.contact(new io.swagger.v3.oas.models.info.Contact().email("enricogollner.tech@gmail.com").name("Enrico Gollner"))
						.description("API para requisição de users")
				);
	}

}

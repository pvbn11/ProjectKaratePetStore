package features.apiPet;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.BeforeAll;

class UsersRunner {

    @BeforeAll
    public static void beforeAll() {
        System.setProperty("karate.env", "e2e");
    }

    @Karate.Test
    Karate testUsers() {
        return Karate.run("classpath:features/apiPet/pets.feature");
//                .tags("@PetSearchByStatus");
        //return Karate.run("users").relativeTo(getClass());
    }

}

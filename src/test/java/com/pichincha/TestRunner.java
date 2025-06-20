package com.pichincha;

import com.intuit.karate.junit5.Karate;

class TestRunner {

    static {
        System.setProperty("karate.ssl", "true");
    }

    @Karate.Test
    Karate runTagged() {
        return Karate.run()
                .tags("@marvel-post-create") // o cualquier otra etiqueta válida
                .path("com/pichincha/features/marvel");
    }
}


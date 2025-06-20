package com.pichincha.features;

import com.intuit.karate.junit5.Karate;

class TestRunner {

    static {
        System.setProperty("karate.ssl", "true");
    }

    @Karate.Test
    Karate runAll() {
        return Karate.run()
                .path("com/pichincha/features/marvel")
                .tags("@marvel-post-create")           // añadir etiqueta a probar
                .relativeTo(getClass());
    }
}


pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    val storageUrl =
        System.getenv()["FLUTTER_STORAGE_BASE_URL"] ?: "https://storage.googleapis.com"
    
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()

        maven {
            setUrl("../game_module/build/host/outputs/repo")
        }
        maven {
            setUrl("$storageUrl/download.flutter.io")
        }
    }
}

rootProject.name = "android"
include(":app")

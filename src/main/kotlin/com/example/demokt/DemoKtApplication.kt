package com.example.demokt

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.context.properties.EnableConfigurationProperties
import org.springframework.boot.runApplication

@SpringBootApplication
@EnableConfigurationProperties(BlogProperties::class)
class DemoKtApplication

fun main(args: Array<String>) {
    runApplication<DemoKtApplication>(*args)
}

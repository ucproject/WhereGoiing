package com.study.firstproject.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


@Configuration 
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
            .antMatchers("/").permitAll()
            .antMatchers("/css/**","/js/**","/img/**").permitAll()
            .antMatchers("/guest/**").permitAll()
            .antMatchers("/user/**").hasAnyRole("USER","ADMIN")
            .antMatchers("/admin/**").hasAnyRole("ADMIN")
            .anyRequest().authenticated();

            http.formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/j_spring_security_check")
                .failureUrl("/loginError")
                .usernameParameter("j_username")
                .passwordParameter("j_password")
                .permitAll();

            http.logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/")
                .permitAll();

                //ssl을 사용하지 않으면 true로 사용
            http.csrf().disable();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception{
        auth.inMemoryAuthentication()
        .withUser("user").password(passwordEncoder().encode("1234")).
        roles("USER")
        .and()
        .withUser("admin").password(passwordEncoder().encode("1234"))
        .roles("ADMIN");
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }
    
}

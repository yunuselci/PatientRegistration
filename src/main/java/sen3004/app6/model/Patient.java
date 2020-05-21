package sen3004.app6.model;

import java.time.LocalDate;

import javax.persistence.*;
import javax.validation.constraints.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "patient")
public class Patient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Size(min = 3, max = 50)
    @Column(name = "fname")
    private String firstName;
    @Size(min = 3, max = 50)
    @Column(name = "lname")
    private String lastName;
    @NotNull
    @Past
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @Column(name = "dob")
    private LocalDate dateOfBirth;
    @Min(value = 12)
    @Column(name = "age")
    private int age;
    @Email
    @NotEmpty
    @Column(name = "email")
    private String email;
    @Pattern(regexp = "[0-9\\s]{12}")
    @Column(name = "phone")
    private String phone;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


}

import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login-form',
  standalone: true,
  imports: [CommonModule,FormsModule],
  templateUrl: './login-form.component.html',
  styleUrl: './login-form.component.css'
})
export class LoginFormComponent {
  user_email="";
  user_password="";

  constructor(private router:Router){};

  submit() {
    console.log("Email : "+this.user_email);
    console.log("Password : "+this.user_password);
    this.user_email="";
    this.user_password="";

    this.router.navigate(['/home']);
  }
}

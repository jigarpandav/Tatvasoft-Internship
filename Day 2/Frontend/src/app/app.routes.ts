import { Routes } from '@angular/router';
import { LoginFormComponent } from './login-form/login-form.component';
import { HomeComponent } from './home/home.component';

export const routes: Routes = [
    {
        path:'',
        component:LoginFormComponent
    },
    {
        path:'home',
        component:HomeComponent
    }
];

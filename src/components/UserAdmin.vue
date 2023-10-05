<template>
  <div>
    <div>
      <input v-model="newUser" @keyup.enter="addUser" placeholder="username" />
    </div>
    <div class="password-input">
      <input v-model="password" @keyup.enter="addUser" placeholder="password" :type="showPassword ? 'text' : 'password'"/>
      <i class="password-toggle" @click="togglePasswordVisibility">{{ showPassword ? '👁️' : '👁️' }}</i>
    </div>
    
    <button @click="addUser">Add New User</button>
    <div style="color:red" v-if="errorMessage"> {{ errorMessage }}</div>
    <ul>
      <li v-for="(user, index) in users" :key="index">
        {{ user }}
      </li>
    </ul>
  </div>
</template>

<script>

import axios from "axios";

export default {
  data() {
    return {
      errorMessage:'',
      newUser: '',
      password:'',
      users: [],
      showPassword: false,
    };
  },
  methods: {
    addUser() {
      const options = {
          method: 'PUT',
          url: 'http://localhost:8000/users/'+this.newUser,
          headers: {'Content-Type': 'application/json'},
          data: {password: this.password}
      };
      if (this.newUser.trim() === '' || this.password.trim() === '') {
        this.errorMessage = 'Fields cannot be empty'
        return; // Prevent adding an empty user
      }
      axios.request(options)
      .then(() => {
        this.getUser()
        this.errorMessage = ''
      }).catch((error) => {
        if(error.response.status === 409){
          this.errorMessage = 'User already exist'
        }
        else {
          // Handle other errors
          this.errorMessage = 'User format error, e.g. myuser@localhost ';
        }
      });
    },
    getUser(){
      axios.get("http://localhost:8000/users")
      .then((response) => {
        const mappedData = response.data.map((item) => item.username);
        this.users = mappedData
      })
    },
    togglePasswordVisibility() {
      this.showPassword = !this.showPassword;
    },
  },

  created() {
    this.getUser()
  }
};
</script>

<style>
.password-input {
  position: relative;
}

.password-toggle {
  position: relative;
  top: 50%;
  right: 30px;
  transform: translateY(-50%);
  cursor: pointer;
}
</style>
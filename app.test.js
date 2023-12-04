const request = require('supertest');
const app = require('app');
const session = require('supertest-session');

const authenticatedSession = session(app);

describe('Login functionality', () => {
  test('Login with 10-digit integer username should redirect to home-asdos', async () => {
    const response = await authenticatedSession
      .post('/')  // Assuming your login form submits via POST to the root route
      .send({ username: '6182001019', password: '12345678' });

    expect(response.statusCode).toBe(302);

    expect(response.headers['location']).toContain('/home-asdos');
  });

  test('Login with Dosen username should redirect to home-dosen', async () => {
    const response = await authenticatedSession
      .post('/')  // Assuming your login form submits via POST to the root route
      .send({ username: 'Dosen01', password: '12345678' });

    expect(response.statusCode).toBe(302);
    
    expect(response.headers['location']).toContain('/home-dosen');
  });
});

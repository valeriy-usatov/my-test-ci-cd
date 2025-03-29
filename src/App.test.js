import { render, screen, fireEvent } from '@testing-library/react';
import App from './App';
import '@testing-library/jest-dom';

// Будем проверять:
// Рендеринг заголовка
// Отображение счетчика
// Клик по кнопке увеличивает счетчик
test('renders Hello world text', () => {
  render(<App />);
  expect(screen.getByText(/Hello world/i)).toBeInTheDocument();
});

test('renders counter with initial value 0', () => {
  render(<App />);
  expect(screen.getByText(/Counter: 0/i)).toBeInTheDocument();
});

test('increments counter when button is clicked', () => {
  render(<App />);
  const button = screen.getByText(/Increment/i);
  fireEvent.click(button);
  expect(screen.getByText(/Counter: 1/i)).toBeInTheDocument();
});

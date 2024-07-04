import express from 'express'

const port = 3000
const app = express()

let largeArray = []

// Ruta que consume mucha CPU
app.get('/cpu', (req, res) => {
  const start = Date.now()
  while (Date.now() - start < 10000) {
    // Hacer cálculos intensivos durante 10 segundos
    Math.sqrt(Math.random())
  }
  res.send('CPU intensive task completed')
})

// Ruta que consume mucha memoria
app.get('/memory', (req, res) => {
  let list = []
  for (let i = 0; i < 1e7; i++) {
    list.push(Math.random())
  }
  largeArray.push([...list])
  list = []
  res.send('Memory intensive task completed')
})

// Ruta para limpiar memoria
app.get('/clear-memory', (req, res) => {
  largeArray = []
  global.gc()
  res.send('Clear memory task completed')
})

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`)
})

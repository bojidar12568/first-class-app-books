const search = document.getElementById('search')
const searchBtn = document.getElementById('searchBtn')

class Book {
    constructor(title, imege, discription) {
        this.title = title
        this.imegeURL = imege
        this.discription = discription
    }
}

class BookHolder {
    products = [
        new Book (
            'The Boys',
            'C:\\Users\\User\\Downloads\\TheBoys.jpg',
            'Very good comics'
        ),
        new Book (
            'Berserk',
            'C:\\Users\\User\\Downloads\\Berserk.jpg',
            'The best manga'
        ),
        new Book (
            'Re:Zero',
            'C:\\Users\\User\\Downloads\\ReZero.jpg',
            'Very good novel'
        )
    ]
    render() {
this.products.forEach( book => {
    const renderHook = new RenderHook(book)
    renderHook.render()
})
    }
renderSearch() {
    searchBtn.addEventListener('click', () => {
        const searchTerm = search.value.toLowerCase()
        const filteredBooks = this.products.filter(book => book.title.toLowerCase().includes(searchTerm))
        const ul = document.querySelector('ul')
        ul.innerHTML = ''
        filteredBooks.forEach(book => {
            const renderHook = new RenderHook(book)
            renderHook.render()
        })
    })  

        }
    
    }

class RenderHook {
    constructor(book) {
        this.book = book
    }
    render() {
       const ul = document.querySelector('ul')
        const li = document.createElement('li')

        li.innerHTML = `
        <h1>${this.book.title}</h1> 
        <img src='${this.book.imegeURL}' alt='${this.book.title}'>
        <p>${this.book.discription} </p>
        `
        

    ul.appendChild(li)
    return li
    }

}

class App {
    render(){
        const bookHolder = new BookHolder()
        bookHolder.render()
    }
   renderSearch() {
    const bookHolder = new BookHolder()
    bookHolder.renderSearch()
   }
   
    }


const app = new App()
app.render()
app.renderSearch()


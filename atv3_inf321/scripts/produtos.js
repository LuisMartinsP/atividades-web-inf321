//carrinho
const contador = document.querySelector(".carrinho-contador");
const aviso = document.getElementById("aviso-carrinho");
const fecharAviso = aviso.querySelector(".aviso-fechar");
let qtdCarrinho = 0;
let timerAviso;

function mostrarAviso() {
    aviso.classList.add("visivel");
    clearTimeout(timerAviso);   // se clicar de novo, o tempo recomeça
    timerAviso = setTimeout(esconderAviso, 3000);
}

function esconderAviso() {
    clearTimeout(timerAviso);
    aviso.classList.remove("visivel");
}

document.querySelectorAll(".produto .btn").forEach((botao) => {
    botao.addEventListener("click", () => {
        qtdCarrinho++;
        contador.textContent = qtdCarrinho;   // CSS coloca os parênteses
        mostrarAviso();
    });
});

fecharAviso.addEventListener("click", esconderAviso);

//busca
const formBusca = document.getElementById("search-form");
const inputBusca = document.getElementById("searchInput");
const botaoLimpar = document.querySelector(".clear-button");
const resultado = document.getElementById("resultado-busca");
const cards = document.querySelectorAll(".produto");

// tira acento e deixa minúsculo: "Tênis" -> "tenis"
const normalizar = (texto) =>
    texto.normalize("NFD").replace(/[̀-ͯ]/g, "").toLowerCase().trim();

function buscar(termo) {
    const busca = normalizar(termo);
    let encontrados = 0;

    cards.forEach((card) => {
        const nome = normalizar(card.querySelector(".nome").textContent);
        const descricao = normalizar(card.querySelector(".descricao").textContent);
        const combina = nome.includes(busca) || descricao.includes(busca);

        card.hidden = !combina;
        if (combina) encontrados++;
    });

    if (busca === "") {
        resultado.hidden = true;
    } else if (encontrados === 0) {
        resultado.textContent = `Nenhum produto encontrado para "${termo.trim()}".`;
        resultado.hidden = false;
    } else {
        resultado.textContent = `${encontrados} produto(s) encontrado(s) para "${termo.trim()}".`;
        resultado.hidden = false;
    }
}

formBusca.addEventListener("submit", (e) => {
    e.preventDefault();   // não recarrega a página
    buscar(inputBusca.value);
});

botaoLimpar.addEventListener("click", () => {
    inputBusca.value = "";
    buscar("");
    inputBusca.focus();
});

// formulário fale conosco
const formContato = document.getElementById("form-contato");
const sucesso = document.getElementById("sucesso-contato");

const campos = [
    { input: document.getElementById("nome"), erro: document.getElementById("erro-nome") },
    { input: document.getElementById("email"), erro: document.getElementById("erro-email") },
    { input: document.getElementById("mensagem"), erro: document.getElementById("erro-mensagem") },
];

formContato.addEventListener("submit", (e) => {
    e.preventDefault();
    let valido = true;

    campos.forEach(({ input, erro }) => {
        const vazio = input.value.trim() === "";
        const emailInvalido = !vazio && input.type === "email" && !input.checkValidity();

        if (vazio) {
            erro.textContent = "Preencha todos os campos obrigatórios!";
        } else if (emailInvalido) {
            erro.textContent = "E-mail inválido.";
        } else {
            erro.textContent = "";
        }
        input.classList.toggle("invalido", vazio || emailInvalido);

        if (vazio || emailInvalido) valido = false;
    });

    if (!valido) {
        sucesso.hidden = true;
        return;
    }

    formContato.reset();
    sucesso.hidden = false;
    setTimeout(() => (sucesso.hidden = true), 4000);
});

//tira o erro do campo assim que a pessoa começa a corrigir
campos.forEach(({ input, erro }) => {
    input.addEventListener("input", () => {
        erro.textContent = "";
        input.classList.remove("invalido");
    });
});

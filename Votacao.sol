// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.17;

contract Votacao {
    address public sindico;
    string public pauta;

    enum Opcao {
    Sim, 
    Nao, 
    Nulo, 
    Abstencao}

    mapping (Opcao => address[]) voto;
    mapping (address => bool) moradores;

    constructor (string memory _pauta){
        sindico = msg.sender;
        pauta = _pauta;
    }

    function votar (Opcao _opcao) public {
        require(!moradores[msg.sender], "Morador ja votou!");
        voto[_opcao].push(msg.sender);
        moradores[msg.sender] = true;
    }

    function verResultado (Opcao _opcao) public view returns (address[] memory){
        return (voto[_opcao]);
    }
}

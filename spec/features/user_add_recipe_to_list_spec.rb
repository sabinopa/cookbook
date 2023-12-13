require 'rails_helper'

feature 'Usuário adiciona receita em uma lista' do
  scenario 'com sucesso' do
    recipe_type = create(:recipe_type, name: 'Sobremesa')
    create(:recipe, title: 'Manjar', cook_time: 60,
                    recipe_type:,
                    ingredients: 'leite condensado, leite, leite de coco',
                    instructions: 'Misture tudo, leve ao fogo e mexa, leve a geladeira')
    recipe_type = create(:recipe_type, name: 'Lanche')
    create(:recipe, title: 'Hamburguer', cook_time: 10,
                    recipe_type:,
                    ingredients: 'hamburguer, pão de hamburguer, queijo',
                    instructions: 'Frite o hamburguer, coloque no pão, coma')
    create(:list, name: 'Favoritas')

    login_as user, scope: :user
    visit recipe_path(recipe)
    click_on 'Adicionar em Favoritas'

    expect(page).to have_content 'Criado por: user@email.com'
    expect(page).to have_content 'Hamburguer'
    expect(page).to have_content 'Lanche'
    expect(page).to have_content '10 minutos'
    expect(page).to have_content 'hamburguer, pão de hambuerguer, queijo'
    expect(page).to have_content 'Frite o hamburguer, coloque no pão, coma'
  end
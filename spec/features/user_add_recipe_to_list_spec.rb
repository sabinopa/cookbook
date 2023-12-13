require 'rails_helper'

feature 'Usuário adiciona receita em uma lista' do
  scenario 'com sucesso' do
    recipe_type = create(:recipe_type, name: 'Sobremesa')
    create(:recipe, title: 'Manjar', cook_time: 60,
                    recipe_type:,
                    ingredients: 'leite condensado, leite, leite de coco',
                    instructions: 'Misture tudo, leve ao fogo e mexa, leve a geladeira')
    create(:list, name: 'Favoritas')

    login_as user, scope: :user
    visit recipe_path(recipe)
    click_on 'Adicionar em Favoritas'

    expect(page).not_to have_content 'Adicionar em Favoritas'
    end
  end
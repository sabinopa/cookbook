require 'rails_helper'

feature 'Recipe API' do
  context 'get api/v1/recipes' do
    scenario 'by title' do
      user = create(:user, email: 'user@email.com', password: '123456', role: :user)
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

      get 'api/v1/recipes', params: { title: 'Hamburguer'}
      
      expect(response.status).to eq 200
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq 2
      expect(json_response).to have_content 'Hamburguer'
      expect(json_response).to have_content 'Lanche'
      expect(json_response).to have_content '10 minutos'
      expect(json_response).to have_content 'hamburguer, pão de hambuerguer, queijo'
    end

    scenario 'by cook_time' do
      user = create(:user, email: 'user@email.com', password: '123456', role: :user)
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

      get 'api/v1/recipes', params: { cook_time: '10'}
      
      expect(response.status).to eq 200
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq 2
      expect(json_response).to have_content 'Hamburguer'
      expect(json_response).to have_content 'Lanche'
      expect(json_response).to have_content '10 minutos'
      expect(json_response).to have_content 'hamburguer, pão de hambuerguer, queijo'
    end

    scenario 'by recipe_type' do
      user = create(:user, email: 'user@email.com', password: '123456', role: :user)
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

      get 'api/v1/recipes', params: { title: 'Lanche'}
      
      expect(response.status).to eq 200
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq 2
      expect(json_response).to have_content 'Hamburguer'
      expect(json_response).to have_content 'Lanche'
      expect(json_response).to have_content '10 minutos'
      expect(json_response).to have_content 'hamburguer, pão de hambuerguer, queijo'
    end

    scenario 'by user email' do
      user = create(:user, email: 'user@email.com', password: '123456', role: :user)
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

      get 'api/v1/recipes'
      
      expect(response.status).to eq 200
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq 2
      expect(json_response).to have_content 'Hamburguer'
      expect(json_response).to have_content 'Lanche'
      expect(json_response).to have_content '10 minutos'
      expect(json_response).to have_content 'hamburguer, pão de hambuerguer, queijo'
    end
  end
end
# encoding: utf-8
require 'spec_helper'

require 'bcrypt'

describe BCrypt do

  describe 'Password' do

    it 'create' do 
      hash = BCrypt::Password.create('Password0', :cost => BCrypt::Engine::DEFAULT_COST)
      expect(hash.to_s).to start_with('$2a$10$')
    end
  end

  describe 'Engine' do

    it 'generate_salt' do 
      salt = BCrypt::Engine.generate_salt(BCrypt::Engine::DEFAULT_COST)
      expect(salt).to start_with('$2a$10$')
    end

    it 'hash_secret' do
      salt = '$2a$10$xxxxxxxxxxxxxxxxxxxxxx'
      hash = BCrypt::Engine.hash_secret('Password0', salt)
      expect(hash).to eq('$2a$10$xxxxxxxxxxxxxxxxxxxxxul/XYj4HKy6ex7YlfZ4IiEN5ri.5eCiG')
    end
  end

end

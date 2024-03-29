package com.vti.backend.service;

import com.vti.backend.repository.AccountRepository;
import com.vti.entity.Account;

import java.sql.SQLException;
import java.util.List;

public class AccountService implements IAccountService{
    AccountRepository repository = new AccountRepository();
    @Override
    public List<Account> getAllAccount() throws SQLException {
        return repository.getAllAccount();
    }

    @Override
    public Account findById(int id) throws SQLException {
        return repository.findById(id);
    }

    @Override
    public void createAccount(Account account) throws SQLException {
        repository.createAccount(account);
    }

    @Override
    public void updateAccount(Account account) throws SQLException {
        repository.updateAccount(account);
    }

    @Override
    public Account findByName(String name) throws SQLException {
        return repository.findByName(name);
    }
}

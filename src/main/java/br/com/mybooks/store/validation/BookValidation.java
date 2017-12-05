package br.com.mybooks.store.validation;

import br.com.mybooks.store.models.Book;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class BookValidation implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return Book.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmpty(errors, "title", "field.required");
        ValidationUtils.rejectIfEmpty(errors, "description", "field.required");

        Book book = (Book) target;
        if (book.getPages() <= 0) {
            errors.rejectValue("pages", "field.required");
        }
    }
}

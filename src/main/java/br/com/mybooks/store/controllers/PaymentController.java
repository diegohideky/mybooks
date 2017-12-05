package br.com.mybooks.store.controllers;

import br.com.mybooks.store.models.Cart;
import br.com.mybooks.store.models.PaymentData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.concurrent.Callable;

@Controller
@RequestMapping("/payment")
public class PaymentController {

    @Autowired
    private Cart cart;

    @Autowired
    private RestTemplate restTemplate;

    @RequestMapping(value = "/finish", method = RequestMethod.POST)
    public Callable<ModelAndView> finish(RedirectAttributes model) {

        return () -> {
            String uri = "http://book-payment.herokuapp.com/payment";

            try {
                String response = restTemplate.postForObject(uri, new PaymentData(cart.getTotal()), String.class);
                System.out.println(response);

                model.addFlashAttribute("success", "Payment done successfully!");
            } catch (HttpClientErrorException e) {
                e.printStackTrace();
                model.addFlashAttribute("fail", "Sorry! Value greater than allowed!");
            }

            return new ModelAndView("redirect:/books");
        };
    }
}

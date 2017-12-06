package br.com.mybooks.store.controllers;

import br.com.mybooks.store.models.Cart;
import br.com.mybooks.store.models.PaymentData;
//import br.com.mybooks.store.models.User;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
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

//    @Autowired
//    private MailSender sender;

    @RequestMapping(value = "/finish", method = RequestMethod.POST)
//    public Callable<ModelAndView> finish(@AuthenticationPrincipal User user, RedirectAttributes model) {
    public Callable<ModelAndView> finish(RedirectAttributes model) {

        return () -> {
            String uri = "http://book-payment.herokuapp.com/payment";

            try {
                String response = restTemplate.postForObject(uri, new PaymentData(cart.getTotal()), String.class);
                System.out.println(response);

//                sendEmailBookShop(user);

                model.addFlashAttribute("success", "Payment done successfully!");
            } catch (HttpClientErrorException e) {
                e.printStackTrace();
                model.addFlashAttribute("fail", "Sorry! Value greater than allowed!");
            }

            return new ModelAndView("redirect:/books");
        };
    }

//    private void sendEmailBookShop(User user) {
//        SimpleMailMessage email = new SimpleMailMessage();
//        email.setSubject("Shopping done successfully");
//        email.setTo(user.getEmail());
//        email.setTo("diegohideky@gmail.com");
//        email.setText("Shopping approved successfully with the value of " + cart.getTotal());
//        email.setFrom("shopping@mybooks.com");
//
//        sender.send(email);
//    }
}

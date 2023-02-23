<?php

namespace App\Controller;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PizzaController extends AbstractController
{


    #[Route('/')]
    public function home(): Response
    {
        return $this->render('bezoeker/home.html.twig');
    }

    #[Route('contact')]
    public function contact(): Response
    {
        $contact = "";
        return $this->render('bezoeker/contact.html.twig',['contact'=>$contact]);
    }

}
<?php

namespace App\Controller;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Category;

class PizzaController extends AbstractController
{


    #[Route('/')]
    public function home(EntityManagerInterface $entityManager): Response
    {
        $category = $entityManager->getRepository(Category::class)->findAll();

        if (!$category) {
            throw $this->createNotFoundException('No product found');
        }
        return $this->render('bezoeker/home.html.twig', ['category' => $category]);
    }

    #[Route('contact')]
    public function contact(): Response
    {
        $contact = "";
        return $this->render('bezoeker/contact.html.twig',['contact'=>$contact]);
    }

}
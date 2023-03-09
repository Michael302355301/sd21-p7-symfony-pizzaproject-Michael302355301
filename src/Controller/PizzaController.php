<?php

namespace App\Controller;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Category;
use Doctrine\Persistence\ManagerRegistry;

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

    #[Route('/category/{id}', name: 'cat_prod')]
    public function category(Category $category, ProductRepository $productRepository ): Response
    {
        $product = $productRepository->findBy(['category' => $category]);

        return $this->render('bezoeker/product.html.twig',
            ['products' => $product,
                'id' => $category]);
        }

    #[Route('contact')]
    public function contact(): Response
    {
        $contact = "";
        return $this->render('bezoeker/contact.html.twig',['contact'=>$contact]);
    }

}
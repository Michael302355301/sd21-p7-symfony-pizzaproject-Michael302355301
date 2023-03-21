<?php

namespace App\Controller;

use App\Entity\Task;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class FormController extends AbstractController
{
    public function new(Request $request): Response
    {
        // creates a task object and initializes some data for this example
         $client = new client();
        $client->setTask('Write a blog post');
        $client->setDueDate(new \DateTime('tomorrow'));

        $form = $this->createFormBuilder($client)
            ->add('name', TextType::class)
            ->add('lastname', TextType::class)
            ->add('adres', TextType::class)
            ->add('postcode', TextType::class)
            ->add('email', TextType::class)
            ->add('phonenumber', TextType::class)
            ->add('submit', SubmitType::class, ['label' => 'Create Task'])
            ->getForm();

        return $this->render('task/new.html.twig', [
            'form' => $form,
        ]);

    }
}
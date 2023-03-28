<?php

namespace App\Forms;

use App\Entity\Product;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
class ArticleFormType extends AbstractType

{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name', TextType::class, ['label' => 'Voornaam'])
            ->add('lastname', TextType::class, ['label' => 'Achternaam'])
            ->add('adress', TextType::class, ['label' => 'Adres'])
            ->add('postcode')
            ->add('email', EmailType::class)
            ->add('phonenumber', IntegerType::class, ['label' => 'Telefoonnummer'])
//            ->add('Bestel',SubmitType::class)
        ;
    }
}
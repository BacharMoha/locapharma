<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class ProfileController extends AbstractController
{
    #[Route('/profile', name: 'app_login')]
    public function loginns(): Response
    {
        return $this->render('login.html.twig', [
            'controller_name' => 'ProfileController',
        ]);
    }
}
